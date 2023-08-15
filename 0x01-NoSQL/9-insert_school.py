#!/usr/bin/env python3
"""Insert doc in a collection."""


def insert_school(mongo_collection, **kwargs):
    """
    Insert a document in a collection.

    args:
        mongo_collection: name the collection
        kwargs: key-word args representing attributes
        of the new document
    Returns:
        id of then document
    """
    document = mongo_collection.insert_one({**kwargs})
    return document.inserted_id
