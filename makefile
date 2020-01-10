website:
	@rm -rf ../cell-lang.github.io/*.html
	@rm -rf ../cell-lang.github.io/*.css
	@rm -rf ../cell-lang.github.io/*.zip
	@rm -rf ../cell-lang.github.io/*.svg
	@cp fonts.css main.css ../cell-lang.github.io/
	@cp cellc-java.zip cellc-cs.zip cellc-cs-win.zip ../cell-lang.github.io/
	@cp imdb.svg mine-pump-2.svg mine-pump.svg ../cell-lang.github.io/
	@cp count-eval.svg norm-eval.svg prod-eval.svg sum-eval.svg ../cell-lang.github.io/
	@cp network-architecture-?.svg ../cell-lang.github.io/
	@rm -rf tmp/
	@mkdir tmp
	@make -s index
	@make -s overview
	@make -s faq
	@make -s example
	@make -s comparison
	@make -s data
	@make -s types
	@make -s functions
	@make -s imperative
	@make -s procedures
	@make -s typechecking
	@make -s miscellanea
	@make -s benchmarks-functional
	@make -s relational
	@make -s data-modeling
	@make -s methods
	@make -s aggregate-functions
	@make -s inheritance
	@make -s wiring
	@make -s design
	@make -s updates
	@make -s using-relational
	@make -s benchmarks-relational
	@make -s reactive
	@make -s using-reactive
	@make -s reactive-future-work
	@make -s interface-cpp
	@make -s interface-java
	@make -s interface-cs
	@make -s relations
	@make -s network-architecture
	@make -s getting-started
	@make -s status-roadmap
	@make -s standard-library
	@make -s standard-library-miscellanea
	@make -s release-notes-07
	@make -s release-notes-09


# cellc-cpp-linux.zip:
# 	cd ../download/cpp/ ; zip -r ../../build-website/cellc-cpp-linux.zip *

cellc-java.zip:
	cd ../downloads/java/ ; zip -r ../../build-website/cellc-java.zip *

cellc-cs.zip:
	cd ../downloads/csharp/ ; zip -r ../../build-website/cellc-cs.zip *

# gen-html: gen-html.cell
# 	@rm -f generated.cpp gen-html
# 	cellc project.txt
# 	g++ -ggdb generated.cpp -o gen-html
# 	@rm -f generated.cpp

# gen-html.exe: gen-html.cell
# 	@rm -f generated.cs gen-html.exe
# 	cellc-cs.exe -d project.txt
# 	mcs -nowarn:219 generated.cs -out:gen-html.exe
# 	@rm -f generated.cs

gen-html.jar: gen-html.cell
	@rm -rf tmp/
	mkdir tmp/
	mkdir tmp/gen/ tmp/cls/
	java -jar ../java/bin/cellcd-java.jar -nrt -d project.txt tmp/gen/
	javac -d tmp/cls/ tmp/gen/*.java
	jar cfe gen-html.jar net.cell_lang.Generated -C tmp/cls/ .

index: gen-html.jar
	@java -jar gen-html.jar ../docs/index.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/index.html
	@cp ../cell-lang.github.io/index.html ../cell-lang.github.io/home.html
	@rm -f tmp/out.txt

overview: gen-html.jar
	@java -jar gen-html.jar ../docs/overview.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/overview.html
	@rm -f tmp/out.txt

example: gen-html.jar
	@java -jar gen-html.jar ../docs/example.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html | sed "s:<span class='k'>since</span>:since:g" > ../cell-lang.github.io/example.html
	@rm -f tmp/out.txt
	@cp ../examples/online-forum/sample-state.txt ../cell-lang.github.io/online-forum-state.txt

comparison: gen-html.jar
	@java -jar gen-html.jar ../docs/comparison.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html | sed "s:<span class='k'>since</span>:since:g" > ../cell-lang.github.io/comparison.html
	@rm -f tmp/out.txt

data: gen-html.jar
	@java -jar gen-html.jar ../docs/data.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/data.html
	@rm -f tmp/out.txt

types: gen-html.jar
	@java -jar gen-html.jar ../docs/types.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/types.html
	@rm -f tmp/out.txt

functions: gen-html.jar
	@java -jar gen-html.jar ../docs/functions.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/functions.html
	@rm -f tmp/out.txt

imperative: gen-html.jar
	@java -jar gen-html.jar ../docs/imperative.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/imperative.html
	@rm -f tmp/out.txt

procedures: gen-html.jar
	@java -jar gen-html.jar ../docs/procedures.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/procedures.html
	@rm -f tmp/out.txt

typechecking: gen-html.jar
	@java -jar gen-html.jar ../docs/typechecking.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/typechecking.html
	@rm -f tmp/out.txt

miscellanea: gen-html.jar
	@java -jar gen-html.jar ../docs/miscellanea.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/miscellanea.html
	@rm -f tmp/out.txt

relational: gen-html.jar
	@java -jar gen-html.jar ../docs/relational.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/relational.html
	@rm -f tmp/out.txt

data-modeling: gen-html.jar
	@java -jar gen-html.jar ../docs/data-modeling.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/data-modeling.html
	@rm -f tmp/out.txt

methods: gen-html.jar
	@java -jar gen-html.jar ../docs/methods.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/methods.html
	@rm -f tmp/out.txt

aggregate-functions: gen-html.jar
	@java -jar gen-html.jar ../docs/aggregate-functions.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/aggregate-functions.html
	@rm -f tmp/out.txt

inheritance: gen-html.jar
	@java -jar gen-html.jar ../docs/inheritance.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/inheritance.html
	@rm -f tmp/out.txt

wiring: gen-html.jar
	@java -jar gen-html.jar ../docs/wiring.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/wiring.html
	@rm -f tmp/out.txt

design: gen-html.jar
	@java -jar gen-html.jar ../docs/design.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/design.html
	@rm -f tmp/out.txt

updates: gen-html.jar
	@java -jar gen-html.jar ../docs/updates.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/updates.html
	@rm -f tmp/out.txt

using-relational: gen-html.jar
	@java -jar gen-html.jar ../docs/using-relational.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/using-relational.html
	@rm -f tmp/out.txt

reactive: gen-html.jar
	@java -jar gen-html.jar ../docs/reactive.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/reactive.html
	@rm -f tmp/out.txt

using-reactive: gen-html.jar
	@java -jar gen-html.jar ../docs/using-reactive.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/using-reactive.html
	@rm -f tmp/out.txt

reactive-future-work: gen-html.jar
	@java -jar gen-html.jar ../docs/reactive-future-work.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/reactive-future-work.html
	@rm -f tmp/out.txt

interface-cpp: gen-html.jar
	@java -jar gen-html.jar ../docs/interface-cpp.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/interface-cpp.html
	@rm -f tmp/out.txt

interface-java: gen-html.jar
	@java -jar gen-html.jar ../docs/interface-java.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/interface-java.html
	@rm -f tmp/out.txt

interface-cs: gen-html.jar
	@java -jar gen-html.jar ../docs/interface-cs.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/interface-cs.html
	@rm -f tmp/out.txt

relations: gen-html.jar
	@java -jar gen-html.jar ../docs/relations.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/relations.html
	@rm -f tmp/out.txt

network-architecture: gen-html.jar
	@java -jar gen-html.jar ../docs/network-architecture.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/network-architecture.html
	@rm -f tmp/out.txt

state: gen-html.jar
	@java -jar gen-html.jar ../docs/state.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/state.html
	@rm -f tmp/out.txt

getting-started: gen-html.jar
	@java -jar gen-html.jar ../docs/getting-started.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/getting-started.html
	@rm -f tmp/out.txt

faq: gen-html.jar
	@java -jar gen-html.jar ../docs/faq.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/faq.html
	@rm -f tmp/out.txt

benchmarks-functional: gen-html.jar
	@java -jar gen-html.jar ../docs/benchmarks-functional.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/benchmarks-functional.html
	@rm -f tmp/out.txt
	@cp ../work/benchmarks/n-body/n-body.cell ../cell-lang.github.io/
	@cp ../work/benchmarks/spectral-norm/spectral-norm.cell ../cell-lang.github.io/
	@cp ../work/benchmarks/binary-trees/binary-trees.cell ../cell-lang.github.io/
	@cp ../work/benchmarks/n-body/n-body-fn.java ../cell-lang.github.io/

benchmarks-relational: gen-html.jar
	@java -jar gen-html.jar ../docs/benchmarks-relational.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/benchmarks-relational.html
	@rm -f tmp/out.txt

status-roadmap: gen-html.jar
	@java -jar gen-html.jar ../docs/status-roadmap.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/status-roadmap.html
	@rm -f tmp/out.txt

standard-library: gen-html.jar
	@java -jar gen-html.jar ../docs/standard-library.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/standard-library.html
	@rm -f tmp/out.txt

standard-library-miscellanea: gen-html.jar
	@java -jar gen-html.jar ../docs/standard-library-miscellanea.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/standard-library-miscellanea.html
	@rm -f tmp/out.txt

release-notes-07: gen-html.jar
	@java -jar gen-html.jar ../docs/release-notes/07-version-0.5.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/java-code-generator-0.5.html
	@rm -f tmp/out.txt

release-notes-09: gen-html.jar
	@java -jar gen-html.jar ../docs/release-notes/09-version-0.5.X.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/java-code-generator-0.5.X.html
	@rm -f tmp/out.txt

test-page: gen-html.jar
	@java -jar gen-html.jar test-page.txt tmp/out.txt
	@cat header.html tmp/out.txt footer.html > ../cell-lang.github.io/test-page.html
	@rm -f tmp/out.txt
	@cp main.css fonts.css ../cell-lang.github.io/

clean:
	@rm -f gen-html.jar
	@make -s soft-clean

soft-clean:
	@rm -f debug/*
	@rm -f ../cell-lang.github.io/*.html
	@rm -f ../cell-lang.github.io/*.css
	@rm -f ../cell-lang.github.io/*.zip
	@rm -f ../cell-lang.github.io/*.svg
	@rm -f ../cell-lang.github.io/*.txt
	@rm -f ../cell-lang.github.io/*.cell
	@rm -f ../cell-lang.github.io/*.java
	@rm -f generated.cpp
	@rm -f tmp/out.txt
