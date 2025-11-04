from ranger.api.commands import Command

class playqmmp(Command):
    """:playqmmp
    Open current folder in qmmp and quit ranger+terminal."""
    def execute(self):
        import os
        os.system(f"nohup qmmp '{self.fm.thisdir.path}' >/dev/null 2>&1 & disown")
        self.fm.exit()  # closes ranger

