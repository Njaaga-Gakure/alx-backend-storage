#!/usr/bin/env python3
"""List documents in a collection."""


from pymongo import MongoClient


def list_all(mongo_collection):
    """
    List documents in a collection.

    args:
        mongo_collection (string): name of the collection
    Returns:
        a cursor object, with is an iterable containing
        list of documents in the collection

    """
    return mongo_collection.find()
