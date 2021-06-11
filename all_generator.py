#!/usr/bin/python
#Cribbing: https://github.com/jtpio/jupyterlite/blob/695373748db6c5aa015224e94d4aa8679eb34ef2/docs/conf.py#L140

from jupyter_server.services.contents.filemanager import FileContentsManager
import json
from pathlib import Path
import datetime


class DateTimeEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, datetime.datetime):
            return o.isoformat()

        return json.JSONEncoder.default(self, o)

        
path = '.'
outdir = Path(path)

files_dir = Path(path) / 'content'

fm = FileContentsManager(root_dir=str(files_dir))
all_json = (
    outdir
    / "all.json"
)
all_json.parent.mkdir(parents=True, exist_ok=True)
all_json.write_text(
        json.dumps(
            fm.get(''), indent=2, sort_keys=True, cls=DateTimeEncoder
        ),
        encoding="utf-8",
    )
