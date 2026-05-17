#!/bin/bash
# scripts/setup-rag.sh
# Setup Retrieval-Augmented Generation (RAG) for self-learning

echo "=== Setting up RAG Knowledge Base ==="

pip install --upgrade langchain langchain-community chromadb sentence-transformers pypdf

mkdir -p config/rag config/rag_db

cat > scripts/rag_query.py << 'EOF'
#!/usr/bin/env python3
"""
RAG Query Tool - Query your personal documents
Usage: python scripts/rag_query.py "Your question here"
"""

import sys
from langchain_community.document_loaders import DirectoryLoader, PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Chroma

def load_and_query(question):
    loader = DirectoryLoader('config/rag', glob="**/*.*", 
                           loader_cls=PyPDFLoader, loader_kwargs={"extract_images": False})
    docs = loader.load()
    
    if not docs:
        print("No documents found in config/rag/")
        return
    
    text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
    texts = text_splitter.split_documents(docs)
    
    embeddings = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")
    db = Chroma.from_documents(texts, embeddings, persist_directory="config/rag_db")
    
    results = db.similarity_search(question, k=4)
    
    print(f"\nRelevant information from your documents for: '{question}'\n")
    for i, doc in enumerate(results, 1):
        print(f"[{i}] {doc.page_content[:400]}...\n")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python scripts/rag_query.py \"Your question\"")
        sys.exit(1)
    load_and_query(sys.argv[1])
EOF

chmod +x scripts/rag_query.py

echo "✅ RAG setup complete."
echo "Place your PDF, TXT, and Markdown files in: config/rag/"
echo "Query them using: python scripts/rag_query.py \"What is my project about?\""
