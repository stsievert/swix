# -*- coding: utf-8 -*-

from numbers import S2_PREFIX

def read_binary(x, filename, prefix=S2_PREFIX):
    """
    :param x: What to write to a file.
    :type x: ndarray, matrix
    :param filename: Where to write the file.
    :type filename: String
    :param prefix: By default, S2_PREFIX. The file is written to the parent directory.
    :type prefix: String
    :return: The contents of the file. Either an ndarray or matrix.
    """

def write_binary(filename, prefix=S2_PREFIX):
    """
    :param filename: Where to write the file.
    :type filename: String
    :param prefix: By default, S2_PREFIX. The file is written to the parent directory.
    :type prefix: String
    """

def read_csv(filename, prefix=S2_PREFIX):
    """
    Reads a CSV.

    :param filename: The file to read from. The file read from the directory containing ``swix/``.
    :param prefix: Defaults to ``S2_PREFIX``
    :type filename: String
    :type prefix: String
    :rtype: ndarray. The contents of the csv.

    .. seealso:: :func:`read_binary`
    """
def write_csv(x, filename, prefix=S2_PREFIX):
    """
    Writes a CSV.

    :param x: The ndarray to write to a csv
    :type x: ndarray
    :type filename: String
    :param filename: Where to write.
    :param prefix: Defaults to S2_PREFIX. Writes to the folder above S2_PREFIX.
    :type prefix: String

    .. seealso:: :func:`write_binary`
    """
