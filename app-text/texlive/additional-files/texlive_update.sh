#!bash

notify --group "TeXLive" --title "Installation in progress" --messageID texliveInstallID \
	--timeout 10000 "Updating TeXLive format files…"
fmtutil-sys --all

if command -v mtxrun; then
	notify --group "TeXLive" --title "Installation in progress" --messageID texliveInstallID \
		--timeout 10000 "Updating TeXLive ConTeXt formats…"
	mtxrun --generate

	notify --group "TeXLive" --title "Installation in progress" --messageID texliveInstallID \
		--timeout 10000 "Updating TeXLive LuaTeX ConTeXt formats…"
	mtxrun --luatex --generate
fi

notify --group "TeXLive" --title "Installation in progress" --messageID texliveInstallID \
	--timeout 10000 "Updating TeXLive font maps…"
updmap-sys

notify --group "TeXLive" --title "Installation in progress" --messageID texliveInstallID \
	--timeout 10000 "Updating TeXLive filename database…"
mktexlsr

notify --group "TeXLive" --title "Installation finished" --messageID texliveInstallID \
	"Took long enough…!"
