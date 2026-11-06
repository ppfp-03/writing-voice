from pathlib import Path
import zipfile

root = Path(__file__).resolve().parent.parent
source = root / 'writing-voice' / 'SKILL.md'
if not source.is_file() or source.stat().st_size == 0:
    raise SystemExit('Missing or empty SKILL.md')
out = root / 'dist'
out.mkdir(exist_ok=True)
archive = out / 'writing-voice.zip'
with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED) as package:
    package.write(source, 'writing-voice/SKILL.md')
print(archive)
