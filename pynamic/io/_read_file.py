from __future__ import annotations

from functools import singledispatch
from typing import TYPE_CHECKING
from typing import Iterable

if TYPE_CHECKING:
    from pynamic.types import StrOrBytePath


class FileLoader: ...


@singledispatch
def load(
    path: StrOrBytePath | Iterable[StrOrBytePath],
):
    pass
