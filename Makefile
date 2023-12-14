.PHONY: clean run present

LATEXMK=latexmk -lualatex -latexoption=-shell-escape

# TARGET=talk-mda-lod-2019-12-zh-cn
TARGET=talk-mda-lod-arch-2019-08-03

run: present

present: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex
	$(LATEXMK) $<

clean:
	BIBINPUTS=$(BIBROOT) $(LATEXMK) -C
	rm -f *.{bbl,aux,ps,dvi,log,toc,out,vrb,snm,nav} *~ ~* *.bak *.synctex.* *.thm *-joined.pdf *.wbk *_latexmk *.fls
	# cd pics && make clean
