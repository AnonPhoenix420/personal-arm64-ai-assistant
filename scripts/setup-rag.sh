#!/bin/bash
# scripts/setup-rag.sh
# Professional RAG setup for self-learning and knowledge retrieval

echo "========================================================================"
echo "Elite Personal AI - RAG (Self-Learning) Setup"
echo "========================================================================"

pip install --upgrade langchain langchain-community chromadb sentence-transformers pypdf

mkdir -p config/rag config/rag_db

cat > scripts/rag_query.py << 'EOF'
#!/usr/bin/env python3
"""
Elite AI RAG Query Tool
Usage: python scripts/rag_query.py "Your question here"
"""

import sys
from langchain_community.document_loaders import DirectoryLoader, PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Chroma

def query_knowledge_base(question: str):
    loader = DirectoryLoader('config/rag', glob="**/*.*", loader_cls=PyPDFLoader)
    docs = loader.load()
    
    if not docs:
        print("No documents found in config/rag/. Add PDFs, TXT, or MD files.")
        return
    
    splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
    texts = splitter.split_documents(docs)
    
    embeddings = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")
    db = Chroma.from_documents(texts, embeddings, persist_directory="config/rag_db")
    
    results = db.similarity_search(question, k=5)
    
    print(f"\n=== Relevant Knowledge for: '{question}' ===\n")
    for i, doc in enumerate(results, 1):
        print(f"[{i}] {doc.page_content[:450]}...\n")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python scripts/rag_query.py \"Your question\"")
        sys.exit(1)
    query_knowledge_base(sys.argv[1])

EOF

chmod +x scripts/rag_query.py

echo "✅ RAG system initialized."
echo "Place your documents in: config/rag/"
echo "Query them using: python scripts/rag_query.py \"question\""
echo "========================================================================"
