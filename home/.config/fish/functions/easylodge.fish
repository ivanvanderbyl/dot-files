function ss -d "Run the script/server"
	script/server $argv
end

function sc -d "Run the Rails console"
	script/console $argv
end

function vde -d "SSH into app server VDE1"
	ssh deploy@vde1.easylodge.com.au $argv
end

