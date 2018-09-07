website:
	@rm -rf ../cell-lang.github.io/*.html
	@rm -rf ../cell-lang.github.io/*.css
	@rm -rf ../cell-lang.github.io/*.zip
	@cp fonts.css main.css ../cell-lang.github.io/
	@cp cellc-cpp-linux.zip cellc-java.zip cellc-cs.zip ../cell-lang.github.io/
	@rm -rf tmp/
	@mkdir tmp
	@make -s index
	@make -s quick-overview
	@make -s overview
	@make -s example
	@make -s comparison
	@make -s data
	@make -s types
	@make -s functions
	@make -s imperative
	@make -s procedures
	@make -s typechecking
	@make -s miscellanea
	@make -s relational
	@make -s updates
	@make -s reactive
	@make -s commands
	@make -s interface-cpp
	@make -s interface-java
	@make -s interface-cs
	@make -s state
	@make -s getting-started
	@make -s benchmarks
	@make -s status-roadmap
	@make -s release-notes-01
	@make -s release-notes-02
	@make -s release-notes-03


cellc-cpp-linux.zip:
	cd ../download/cpp/ ; zip -r ../../build-website/cellc-cpp-linux.zip *

cellc-java.zip:
	cd ../download/java/ ; zip -r ../../build-website/cellc-java.zip *

cellc-cs.zip:
	cd ../download/csharp/ ; zip -r ../../build-website/cellc-cs.zip *

gen-html: gen-html.cell
	@rm -f generated.cpp gen-html
	cellc project.txt
	g++ -ggdb generated.cpp -o gen-html
	@rm -f generated.cpp

gen-html.exe: gen-html.cell
	@rm -f generated.cs gen-html.exe
	cellc-cs.exe -d project.txt
	mcs -nowarn:219 generated.cs -out:gen-html.exe
	@rm -f generated.cs

gen-html.jar: gen-html.cell
	@rm -rf tmp/
	mkdir tmp/
	mkdir tmp/gen/ tmp/cls/
	java -jar ~/bin/cellc-java.jar project.txt tmp/gen/
	javac -d tmp/cls/ tmp/gen/*.java
	jar cfe gen-html.jar net.cell_lang.Generated -C tmp/cls/ .

index: gen-html.exe
	@./gen-html.exe ../docs/index.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/index.html
	@cp ../cell-lang.github.io/index.html ../cell-lang.github.io/home.html
	@rm -f tmp/out.txt

quick-overview: gen-html.exe
	@./gen-html.exe ../docs/quick.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/quick.html
	@rm -f tmp/out.txt

overview: gen-html.exe
	@./gen-html.exe ../docs/overview.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/overview.html
	@rm -f tmp/out.txt

example: gen-html.exe
	@./gen-html.exe ../docs/example.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html | sed "s:<span class='k'>since</span>:since:g" > ../cell-lang.github.io/example.html
	@rm -f tmp/out.txt
	@cp online-forum-state.txt ../cell-lang.github.io/

comparison: gen-html.exe
	@./gen-html.exe ../docs/comparison.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html | sed "s:<span class='k'>since</span>:since:g" > ../cell-lang.github.io/comparison.html
	@rm -f tmp/out.txt

data: gen-html.exe
	@./gen-html.exe ../docs/data.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/data.html
	@rm -f tmp/out.txt

types: gen-html.exe
	@./gen-html.exe ../docs/types.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/types.html
	@rm -f tmp/out.txt

functions: gen-html.exe
	@./gen-html.exe ../docs/functions.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/functions.html
	@rm -f tmp/out.txt

imperative: gen-html.exe
	@./gen-html.exe ../docs/imperative.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/imperative.html
	@rm -f tmp/out.txt

procedures: gen-html.exe
	@./gen-html.exe ../docs/procedures.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/procedures.html
	@rm -f tmp/out.txt

typechecking: gen-html.exe
	@./gen-html.exe ../docs/typechecking.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/typechecking.html
	@rm -f tmp/out.txt

miscellanea: gen-html.exe
	@./gen-html.exe ../docs/miscellanea.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/miscellanea.html
	@rm -f tmp/out.txt

relational: gen-html.exe
	@./gen-html.exe ../docs/relational.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/relational.html
	@rm -f tmp/out.txt

updates: gen-html.exe
	@./gen-html.exe ../docs/updates.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/updates.html
	@rm -f tmp/out.txt

reactive: gen-html.exe
	@./gen-html.exe ../docs/reactive.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/reactive.html
	@rm -f tmp/out.txt

commands: gen-html.exe
	@./gen-html.exe ../docs/commands.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/commands.html
	@rm -f tmp/out.txt

interface-cpp: gen-html.exe
	@./gen-html.exe ../docs/interface-cpp.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/interface-cpp.html
	@rm -f tmp/out.txt

interface-java: gen-html.exe
	@./gen-html.exe ../docs/interface-java.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/interface-java.html
	@rm -f tmp/out.txt

interface-cs: gen-html.exe
	@./gen-html.exe ../docs/interface-cs.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/interface-cs.html
	@rm -f tmp/out.txt

state: gen-html.exe
	@./gen-html.exe ../docs/state.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/state.html
	@rm -f tmp/out.txt

getting-started: gen-html.exe
	@./gen-html.exe ../docs/getting-started.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/getting-started.html
	@rm -f tmp/out.txt

benchmarks: gen-html.exe
	@./gen-html.exe ../docs/benchmarks.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/benchmarks.html
	@rm -f tmp/out.txt
	@cp ../work/benchmarks/n-body/n-body.cell ../cell-lang.github.io/
	@cp ../work/benchmarks/spectral-norm/spectral-norm.cell ../cell-lang.github.io/
	@cp ../work/benchmarks/binary-trees/binary-trees.cell ../cell-lang.github.io/
	@cp ../work/benchmarks/n-body/n-body-fn.java ../cell-lang.github.io/

status-roadmap: gen-html.exe
	@./gen-html.exe ../docs/status-roadmap.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/status-roadmap.html
	@rm -f tmp/out.txt

release-notes-01: gen-html.exe
	@./gen-html.exe ../docs/release-notes/01-csharp-code-generator-0.1.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/csharp-code-generator-0.1.html
	@rm -f tmp/out.txt

release-notes-02: gen-html.exe
	@./gen-html.exe ../docs/release-notes/02-java-code-generator-0.1.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/java-code-generator-0.1.html
	@rm -f tmp/out.txt

release-notes-03: gen-html.exe
	@./gen-html.exe ../docs/release-notes/03-version-0.2.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/java-code-generator-0.2.html
	@rm -f tmp/out.txt


clean:
	@rm -f gen-html.exe
	@make -s soft-clean

soft-clean:
	@rm -f debug/*
	@rm -f ../cell-lang.github.io/*.html
	@rm -f ../cell-lang.github.io/*.css
	@rm -f ../cell-lang.github.io/*.zip
	@rm -f ../cell-lang.github.io/*.txt
	@rm -f ../cell-lang.github.io/*.cell
	@rm -f ../cell-lang.github.io/*.java
	@rm -f generated.cpp
	@rm -f tmp/out.txt
