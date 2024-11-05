.PHONY: clean run present

LATEXMK=latexmk -lualatex -latexoption=-shell-escape

TARGET=talk-la-in-soft-data-design-2023-12-18

run: present

present: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex
	$(LATEXMK) $<

clean:
	BIBINPUTS=$(BIBROOT) $(LATEXMK) -C $(TARGET)
	rm -f *.{bbl,aux,ps,dvi,log,toc,out,vrb,snm,nav} *~ ~* *.bak *.synctex.* *.thm *-joined.pdf *.wbk *_latexmk *.fls
	# cd pics && make clean

handout: 
	psnup --a4paper --keepinfo -6 --frame true \
        --scale 0.92 --no-landscape --outfile $(TARGET)handout.pdf $(TARGET).pdf