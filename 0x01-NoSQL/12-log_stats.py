#!/usr/bin/env python3
"""Provide stats about a collection."""


from pymongo import MongoClient


def get_stats():
    """Provide stats about a collection."""
    client = MongoClient('mongodb://127.0.0.1:27017')
    nginx = client.logs.nginx
    print(f"{nginx.count_documents({})} logs")
    print("Methods:")
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        count = nginx.count_documents({'method': method})
        print(f"\tmethod {method}: {count}")
    get_count = nginx.count_documents({'method': 'GET', 'path': '/status'})
    print(f"{get_count} status check")


if __name__ == "__main__":
    get_stats()
