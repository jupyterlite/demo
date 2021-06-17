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

outdir = Path(path) / 'file_manifests'
outdir.mkdir(exist_ok=True)

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
        encoding="utf-8"
    )

# We then need to do this for every directory in the contents dir
for p in files_dir.iterdir():
    if p.is_dir():
        rel_p =  p.relative_to(str(files_dir))
        
        all_json = (outdir / rel_p / "all.json")
        all_json.parent.mkdir(parents=True, exist_ok=True)
        
        all_json.write_text(
            json.dumps(fm.get(str(rel_p)), indent=2, sort_keys=True, cls=DateTimeEncoder),
            encoding="utf-8"
        )
