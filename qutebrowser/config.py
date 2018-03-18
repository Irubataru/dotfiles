# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig()

c.aliases = {"q": "quit", "w": "session-save", "wq": "quit --save"}
c.auto_save.session = True
c.editor.command = [
    "urxvt", "-e", "vim", "-f", "'{file}'", "-c", "normal {line}G{column0}l"
]

c.spellcheck.languages = ["nb-NO", "en-GB"]

c.url.searchengines = {
    "DEFAULT":
    "https://google.com/search?q={}",
    "arch":
    "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}",
    "aur":
    "https://aur.archlinux.org/packages/?O=0&K={}",
    "c":
    "http://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={}",
    "cpp":
    "http://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={}",
    "ctan":
    "http://ctan.org/search?phrase={}",
    "jap":
    "http://jisho.org/words/?jap={}&eng=&dict=edict",
    "eng":
    "http://jisho.org/words/?eng={}&jap=&dict=edict",
    "gw2":
    "https://wiki.guildwars2.com/index.php?title=Special:Search&search={}",
    "tex":
    "http://en.wikibooks.org/wiki/Special:Search?search={}&prefix=LaTeX&fulltext=Search+this+book&fulltext=Search",
    "w":
    "http://en.wikipedia.org/w/index.php?title=Special:Search&search={}",
    "wno":
    "http://no.wikipedia.org/w/index.php?title=Spesial:S%C3%B8k&search={}",
    "y":
    "http://www.youtube.com/results?search_query={}"
}

c.url.start_pages = "https://google.com"
c.url.default_page = "about:blank"

c.zoom.default = "125%"

config.bind('<Ctrl-F2>',
            'spawn --userscript ~/.config/qutebrowser/password_fill')
