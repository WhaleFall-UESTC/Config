# 安装 zsh
sudo apt install zsh
# 确认 zsh 成功安装
which zsh
# 设置为默认 Shell
chsh -s /usr/bin/zsh
# 克隆项目到“~/”位置
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# 将配置文件复制到指定位置
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# 下载主题 Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
# 下载插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# 接着在 ~/.zshrc 中设置 ZSH_THEME="powerlevel10k/powerlevel10k"，plugins=(git zsh-autosuggestions zsh-syntax-highlighting)，重启终端后即可查看到效果
# 但是可以使用本仓库下的 zshrc，没必要再修改
