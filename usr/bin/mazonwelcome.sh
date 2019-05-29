#!/usr/bin/env bash
#=======================HEADER========================================|
#AUTOR
# Jefferson 'Slackjeff' Rocha <root@slackjeff.com.br>
#
# Exibe tela de boa vindas para distribuição MazonOS
# Criado totalmente em bash + YAD.
#
#=====================================================================|

#===================================| VARIÁVEIS
# Nome programa
PRG='Mazon Welcome'

# Versão
VERSION='1.0'

# Arquivo temporário para exclusão
temp="/etc/xdg/autostart/mazonwelcome.desktop"

# Localização dos icones
icon='/usr/share/pixmaps/mazonwelcome'

# Websites para usar com xdg-open.
sites=(
    [0]='www.mazonos.com'
    [1]='http://mazonos.com/en/wiki.html'
    [2]='https://bananapkg.github.io/doc-ptbr.html'
    [3]='http://mazonos.com/forum/'
    [4]='https://github.com/mazonos'
)

#===================================| INICIO

# Menu Principal + Abas
 yad --title="$PRG"            \
    --width="800"              \
    --height="500"             \
    --text-align=left          \
    --center                   \
    --image-on-top             \
    --undecorated              \
    --fontname="monospace 56"  \
    --image="${icon}/logo.png" \
    --borders=10               \
    --text="
<big><b>MazonOS</b> Welcome</big>

Seja muito bem vindo, abaixo você pode conferir algumas opções para você iniciar no sistema!"               \
    --form  --columns 4                                                                                     \
    --field="<b>Documento</b>!${icon}/documentos.png!Documentação para Iniciar":BTN "xdg-open ${sites[1]} " \
    --field="<b>Site Mazon</b>!${icon}/site.png!Site oficial da Mazon":BTN "xdg-open ${sites[0]}"           \
    --field="<b>BananaPkg</b>!${icon}/bananapkg.png!Documentação do BananaPKG":BTN "xdg-open ${sites[2]}"   \
    --field="<b>Fórum Mazon</b>!${icon}/forum.png!Fórum Oficial":BTN "xdg-open ${sites[3]}"                 \
    --field="<b>Sobre</b>!${icon}/sobre.png!Sobre":BTN "
 yad --width='500'
     --height='100'
     --center
     --undecorated
     --image="${icon}/sobreyad.png"
     --borders=5
     --text-align=left
     --text='

<big><b>$PRG</b></big>

<b>Versão:</b> $VERSION
<b>Licença:</b> Mit
<b>Criado por:</b> Jefferson 'Slackjeff' Rocha
<b>Contato:</b> root@slackjeff.com.br'
     --button="Sair":1
"                                                                                                           \
    --field="<b>Doação</b>!${icon}/doe.png!Faça uma doação e ajude o projeto.":BTN  "ls"                    \
    --field="<b>Bate Papo</b>!${icon}/chat.png!Grupo no Telegram":BTN "
 yad --width='500'
     --height='100'
     --center
     --undecorated
     --image="${icon}/telegram.png"
     --borders=5
     --text-align=left
     --text='

<big><b>Bate Papo</b></big>

Venha bater um bate papo com o pessoal do projeto! Estamos esperando você :)

<b>Telegram:</b> @gnewlinux
<b>IRC:</b> Estamos também na freenode #mazonos'
     --button="Sair":1
"                                                                                                       \
    --field="<b>Github</b>!${icon}/github.png!Github do projeto":BTN  "xdg-open ${sites[4]}"            \
    --button="Sair":1

# O autoiniciar deve ser apenas no primeiro boot.
# Após isso deve ser excluido.
if [[ -e "$temp" ]]; then
    rm "$temp"
fi
