#!/bin/bash

# Function to check if pm2 is installed
check_pm2_installed() {
    if command -v pm2 &>/dev/null; then
        return 0  # pm2已安装
    else
        return 1  # pm2未安装
    fi
}


# Function to install pm2
install_pm2() {
    if ! check_pm2_installed; then
        curl -s https://raw.githubusercontent.com/k0baya/alist_repl/main/serv00/install-pm2.sh | bash
        echo "pm2安装成功。"
    else
        echo "pm2已经安装。"
    fi
}



# Function to deploy vless
deploy_vless() {
    # 赋予vless维护脚本权限
    chmod +x ./vless/check_vless.sh
    # 安装依赖
    npm install --prefix ./vless
    # 进入工作目录
    cp -r ./vless ~/domains/$USER.ct8.pl
# ANSI颜色码
GREEN='\033[0;32m'
NC='\033[0m'  # 恢复默认颜色

# 输出绿色的 "HAO GEGE"
echo -e "${GREEN} .-------------------------------. "
echo -e "      _____  _______ ___    _____   _       "
echo -e "     / ____||__   __/ _ \  |  __ \ | |      " 
echo -e "    | |        | | | (_) | | |__) || |      "
echo -e "    | |        | |  > _ <  |  ___/ | |      "
echo -e "    | |____    | | | (_) |_| |     | |____  " 
echo -e "     \_____|   |_|  \___/(_)_|     |______| "
echo -e "-------------------------------------------- ${NC}"
echo -e "HAOGEGE YouTuBe: ${GREEN}https://www.youtube.com/@haogege${NC}"
echo -e "TG技术交流群: ${GREEN}https://t.me/haogege${NC}"
echo -e "--------------------------------------------------------------------------------------------------"
echo -e "请执行以下脚本:${GREEN}cd ~/domains/$USER.ct8.pl/vless && ./check_vless.sh -p <端口号>${NC}"
}

# Main function
main() {
    echo "正在安装pm2..."
    install_pm2
    echo "正在部署vless到指定目录..."
    deploy_vless
}

# 执行主函数
main "$@"

