function update -d 'Run common software update commands'
    npm update npm -g
	npm update -g
	sudo softwareupdate -i -a
	gem update --system
	gem update
	brew update
	brew upgrade
end
