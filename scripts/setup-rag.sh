#!/bin/bash
# scripts/setup-rag.sh
# Setup Retrieval-Augmented Generation for self-learning

echo "=== Setting up RAG for Personal Knowledge Base ==="

pip install --upgrade langchain langchain-community chromadb sentence-transformers pypdf

mkdir -p config/rag

echo "RAG directory created at config/rag/"
echo "Place your PDF, TXT, or Markdown documents in that folder."
echo ""

cat > scripts/rag_query.py << 'EOF'
#!/usr/bin/env python3
from langchain_community.document_loaders import DirectoryLoader, TextLoader, PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Chroma
import sys

def load_documents():
    loader = DirectoryLoader('config/rag', glob="**/*.*", 
                           loader_cls=PyPDFLoader, 
                           loader_kwargs={"extract_images": False})
    docs = loader.load()
    text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
    return text_splitter.split_documents(docs)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python scripts/rag_query.py 'Your question here'")
        sys.exit(1)
    
    query = sys.argv[1]
    docs = load_documents()
    
    embeddings = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")
    db = Chroma.from_documents(docs, embeddings, persist_directory="config/rag_db")
    
    results = db.similarity_search(query, k=4)
    print("\nRelevant context from your documents:")
    for doc in results:
        print("- " + doc.page_content[:300] + "...\n")
EOF

chmod +x scripts/rag_query.py

echo "RAG setup complete."
echo "Add documents to config/rag/ and use: python scripts/rag_query.py 'Your question'"
