# -*- coding: utf-8 -*-

def read_binary(x, filename):
    """
    :param x: What to write to a file.
    :type x: ndarray, matrix
    :param filename: Where to write the file.
    :type filename: String
    :return: The contents of the file. Either an ndarray or matrix.
    """

def write_binary(x, filename):
    """
    :param x: The content to write to a file.
    :type x: ndarray, matrix
    :param filename: Where to write the file.
    :type filename: String
    .. seealso:: `np.fromfile`_, `ndarray.tofile`_

    >>> # SWIFT
    >>> var N = 5
    >>> var x = ones((N, N)) * phi
    >>> write_binary(x, filename:"x.bin")
    >>> #
    >>> # PYTHON:
    >>> data = np.fromfile("x.bin")
    >>> width, height = data[0], data[1]
    >>> x = data[2:].reshape(width, height)

    """

class CSVFile:
    """
    A simple class to represent a CSV file. It has two members, "header" and
    "data". "header" is a list of string and "data" is a matrix.

    >>> var x:matrix = rand(N:(3, 3))
    >>> csv = CSVFile(x, ["1", "2", "3"])
    >>> write_csv(csv, filename:"/path/to/file")
    >>>
    >>> # one of the following options
    >>> var csv:CSVFile = read_csv("/path/to/file")
    >>> var x:matrix = read_csv("/path/to/file").data
    """

def read_csv(filename):
    """
    Reads a CSV.

    :param filename: The file to read from. The file read from the directory containing ``swix/``.
    :type filename: String
    :param rowWithoutMissingData: A row that has complete data. From this row,
        we infer if that particular row is categorical or numerical for the entire
        CSV. If there are N categories, we assign indicies 0 through N-1.
    :type rowWithoutMissingData: Int
    :param header_present: If false, the first row will be included as part of
        the dataset. It default to true in which case the header will also be
        returned.
    :rtype: ndarray. The contents of the csv.

    .. seealso:: :func:`read_binary`
    """

def write_csv(x, filename, header):
    """
    Writes a CSV.

    :param x: The ndarray to write to a csv
    :type x: ndarray, matrix, CSVFile

    :param header: The header to write at the top of the CSV file
    :type header: List of strings.

    :type filename: String
    :param filename: Where to write.

    .. seealso:: :func:`write_binary`
    """
