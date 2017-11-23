website:
	@rm -rf ../cell-lang.github.io/*.html
	@rm -rf ../cell-lang.github.io/*.css
	@rm -rf ../cell-lang.github.io/*.zip
	@cp fonts.css main.css download.zip ../cell-lang.github.io/
	@rm -rf tmp/
	@mkdir tmp
	@make -s index
	@make -s overview
	@make -s data-model
	@make -s types
	@make -s functions
	@make -s imperative
	@make -s procedures
	@make -s typechecking
	@make -s miscellanea
	@make -s static
	@make -s updates
	@make -s reactive
	@make -s commands
	@make -s interface
	@make -s state
	@make -s getting-started

gen-html: gen-html.cell
	@rm -f generated.cpp gen-html
	cellc project.txt
	g++ -ggdb generated.cpp -o gen-html
	@rm -f generated.cpp

index: gen-html
	@./gen-html ../docs/index.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/index.html
	@rm -f tmp/out.txt

overview: gen-html
	@./gen-html ../docs/overview.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/overview.html
	@rm -f tmp/out.txt

data-model: gen-html
	@./gen-html ../docs/data-model.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/data-model.html
	@rm -f tmp/out.txt

types: gen-html
	@./gen-html ../docs/types.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/types.html
	@rm -f tmp/out.txt

functions: gen-html
	@./gen-html ../docs/functions.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/functions.html
	@rm -f tmp/out.txt

imperative: gen-html
	@./gen-html ../docs/imperative.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/imperative.html
	@rm -f tmp/out.txt

procedures: gen-html
	@./gen-html ../docs/procedures.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/procedures.html
	@rm -f tmp/out.txt

typechecking: gen-html
	@./gen-html ../docs/typechecking.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/typechecking.html
	@rm -f tmp/out.txt

miscellanea: gen-html
	@./gen-html ../docs/miscellanea.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/miscellanea.html
	@rm -f tmp/out.txt

static: gen-html
	@./gen-html ../docs/static.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/static.html
	@rm -f tmp/out.txt

updates: gen-html
	@./gen-html ../docs/updates.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/updates.html
	@rm -f tmp/out.txt

reactive: gen-html
	@./gen-html ../docs/reactive.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/reactive.html
	@rm -f tmp/out.txt

commands: gen-html
	@./gen-html ../docs/commands.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/commands.html
	@rm -f tmp/out.txt

interface: gen-html
	@./gen-html ../docs/interface.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/interface.html
	@rm -f tmp/out.txt

state: gen-html
	@./gen-html ../docs/state.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/state.html
	@rm -f tmp/out.txt

getting-started: gen-html
	@./gen-html ../docs/getting-started.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/getting-started.html
	@rm -f tmp/out.txt


clean:
	@rm -f gen-html
	@make -s soft-clean

soft-clean:
	@rm -f debug/*
	@rm -f ../cell-lang.github.io/*.html
	@rm -f ../cell-lang.github.io/*.css
	@rm -f ../cell-lang.github.io/*.zip
	@rm -f generated.cpp
	@rm -f tmp/out.txt
