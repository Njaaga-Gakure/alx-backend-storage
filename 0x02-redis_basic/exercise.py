#!/usr/bin/env python3
"""Writing strings to Redis."""


import redis
import uuid
from typing import Union, Callable


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

    def get(self, key: str,
            fn: Callable = None) -> Union[str, bytes, int, float, None]:
        """
        Get a value using a key.

        args:
            key (str): key used to obtain the value
            fn (Callable): function to typecast the value
        Returns:
            value corresponding to the key
            or `None` if the value is not found

        """
        value = self._redis.get(key)
        if not value:
            return None
        return fn(value) if fn else value

    def get_str(self, key: str) -> str:
        """Get a value using a key."""
        return str(self._redis.get(key))

    def get_int(self, key: str) -> int:
        """Get a value using a key."""
        return int(self._redis.get(key))
