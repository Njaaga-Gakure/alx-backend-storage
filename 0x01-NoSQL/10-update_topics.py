#!/usr/bin/env python3
"""Update a document based on the name."""


def update_topics(mongo_collection, name, topics):
    """
    Update a document in a collection based on a name.

    args:
        mongo_collection: collection name
        name: name attribute of the document to be updated
        topics: topic attribute of the document
    """
    mongo_collection.update_many({"name": name},
                                 {"$set": {"topics": topics}})
