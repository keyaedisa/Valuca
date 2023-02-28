Valuca - A zsh-theme inspired by the Ducula theme inspired by the Dracula project
==================================================================================

Most features are entirely thanks to [janjoswig's ducula theme](https://github.com/janjoswig/Ducula)
I simply added my own touch to an otherwise perfect theme.

Prompt features
---------------
 * Job status: Indicates if jobs are running in the background :coffee: (idea from agnoster theme)
 * Username abbreviations: Uses a different username if the corresponding mapping was set (idea from dieter theme)
 * Hostname abbreviations: Uses a different hostname if the corresponding mapping was set (idea from dieter theme)
 * Virtual environments: Shows the name of activated virtual environment via ${VIRTUAL_ENV}
 * Current path: Displays the full current working directory
 * Return status: Shows the error return code (:bat:/:duck:)
 * Git messages: Uses `git_super_status` from the git-prompt plugin
 * Prompt time: Timestamp (hh:mm)

Example
-------

![valuca prompt theme](https://keyaedisa.github.io/images/valcula.png)


Installation
------------

Clone the repository into your custom oh-my-zsh themes folder:

    git clone https://github.com/keyaedisa/Valuca.git ${ZSH_CUSTOM}/themes/Valuca

Set the theme in your .zshrc:

   ZSH_THEME="Valula/valuca"

Links
-----

Kept Jan's link because they may provide inside for others too study. Def need the git-prompt plugin though.

The agnoster theme: <https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/agnoster.zsh-theme>

The dieter theme: <https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/dieter.zsh-theme>

The git-prompt plugin: <https://github.com/olivierverdier/zsh-git-prompt>

