#!/usr/bin/env python3
"""List all docs containing a certain topic."""


def schools_by_topic(mongo_collection, topic):
    """
    List all docs containing a topic in a collection.

    args:
        mongo_collection: a collection
        topic (str): topic to search for

    """
    return mongo_collection.find({"topics": topic})
