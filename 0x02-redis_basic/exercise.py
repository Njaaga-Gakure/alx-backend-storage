#!/usr/bin/env python3
"""Writing strings to Redis."""


import redis
import uuid
from typing import Union


class Cache:
    """Class that represents a cache."""

    def __init__(self, host="localhost", port="6379", db=0):
        """Store an instance of the Redis client into a private variable."""
        self._redis = redis.Redis(host=host, port=port, db=db)
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        Set a key to a value.

        args:
            data(str | bytes | int | float): the data to be set to the key
        Returns:
            the key set to the data

        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
