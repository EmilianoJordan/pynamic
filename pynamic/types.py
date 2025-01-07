from os import PathLike

StrOrBytePath = str | bytes | PathLike[bytes] | PathLike[str]
