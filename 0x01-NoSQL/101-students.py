#!/usr/bin/env python3
"""Return all students sorted by avg score."""


def top_students(mongo_collection):
    """
    Sort students by average score.

    args:
        mongo_collection: a collection
    Returns:
        the students sorted by avg score

    """
    pipeline = [
        {'$unwind': '$topics'},
        {
         '$group': {
                    '_id': '$_id',
                    'name': {'$first': '$name'},
                    'averageScore': {'$avg': '$topics.score'}
                   }},
         {'$sort': {'averageScore': -1}}
        ]
    return mongo_collection.aggregate(pipeline)
