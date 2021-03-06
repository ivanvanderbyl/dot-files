cd $HOME ^/dev/null # for some reason $PWD is empty in new consoles

mkdir -p ~/.l

set fish_greeting ''

set path_list /Library/PostgreSQL8/bin /opt/local/*bin /opt/local/*/*bin /usr/local/*bin /usr/local/*/*bin /opt/nginx/*bin ~/.config/fish/bin  /usr/local/arm/bin

set cd_path_list    . ~ ~/Sites ~/Code /Volumes ~/.l

set PATH /usr/sbin /usr/bin /sbin /bin

for i in $path_list
	if not contains $i $PATH
		if test -d $i
			set PATH $i $PATH
		end
	end
end

for i in $cd_path_list
	if not contains $i $CDPATH
		if test -d $i
			set CDPATH $CDPATH $i
		end
	end
end

set -x EDITOR    (echo (which mate) -w)
set -x VISUAL    $EDITOR
set -x GIT_EDITOR "mate -wl1" # ensures cursor is at beginning of document

set -x CLICOLOR 1
set -x JAVA_HOME "/usr/"
set -U BROWSER "open -a Safari"

set -x JEWELER_OPTS "--rspec --gemcutter --rubyforge --reek --roodi"

set fish_color_cwd blue
set fish_color_uneditable_cwd red

bind \er 'restart_rails_app >/dev/null'

# function reload_easylodge_db
# 	echo "Dropping database..."
# 	mysql -uroot -psetsquare -e "drop database easylodge_development"
# 	echo "Creating new database..."
# 	mysql -uroot -psetsquare -e "create database easylodge_development"
# 	echo "Loading data into database..."
# 	mysql -uroot -psetsquare easylodge_development < $argv
# end

function vde
  echo "Opening secure connection to VDE1..."
  ssh deploy@vde1.easylodge.com.au
end

function restart
	echo "Restarting application..."
	if test './tmp/restart.txt'
		touch ./tmp/restart.txt
		echo "Done."
	else
		echo "Not a Rails application."
	end
end

