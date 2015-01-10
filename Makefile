#Diretorio de instalação
DIRBIN=/usr/bin
DIRETC=/usr/lib/arnu
#Diretorio do atalho de lançador
DIRLAN=/usr/share/applications/

#Compila aplicativo
arnu: arnu
	@echo 'Compilando aplicativo...'
	@lazbuild -B src/Arnu.lpr

.PHONY: clean

#Limpa arquivos de compilação
clean:
	@echo 'Limpando arquivos de compilação...'
	@if [ -d src/lib ]:; then rm src/lib -r; fi
	@if [ -f src/arnu ]:; then rm src/arnu; fi

.PHONY: install

#Instala aplicativo, copiando arquivos para pastas
install:
	@mkdir $(DIRETC)
	@echo 'Copiando arquivos binários...'
	@cp src/arnu $(DIRBIN)
	@echo 'Copiando arquivos de instalação...'
	@cp other/icone.jpg $(DIRETC)
	@cp other/lauchapplication.sh $(DIRETC)
	@echo 'Criando atalho no lançador...'
	@desktop-file-install other/ARNU.desktop

.PHONY: uninstall

#Desinstala aplicativo, removendo arquivos das pastas
uninstall:
	@echo 'Removendo arquivos de instalação...'
	@rm -f $(DIRBIN)/arnu
	@rm -rf $(DIRETC)
	@echo 'Removendo atalho do lançador...'
	@rm -f $(DIRLAN)'ARNU.desktop'
