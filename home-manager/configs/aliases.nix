{
  myAliases = {
    ".." = "cd ..";
    "cd.." = "cd ..";

    ls = "command eza";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";

    l = "eza -G --icons";
    ll = "eza -l --icons";
    lg = "eza -lG";
    lall = "eza -lahF --icons --git";
    lalg = "eza -laGhF --icons --git";
    latree = "eza -laGghHT --git --icons";
    la = "eza --git --icons -la";
    lsd = "eza -laD";

    cls = "clear";
    userlist = "cut -d: -f1 /etc/passwd";
    free = "free -mt";
    du = "du -ach | sort -h";
    ps = "ps auxf";

    sudo = "sudo ";
    reload = "exec $SHELL -l";

    hibernate = "systemctl hibernate";

    mkdir = "mkdir -pv";
    psmem = "ps -e -orss=,args= | sort -b -k1 -nr";
    psmem10 = "ps -e -orss=,args= | sort -b -k1 -nr | head -10";
    pscpu = "ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr";
    pscpu10 = "ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr | head -10";

    xclip = "xclip -selection c";

    gua = "git remote | xargs -L1 git push --all";

    fetch = "fastfetch";
    rebuild = "nh os switch";
    update = "nh os switch --update";
    garbage = "nh clean all && sudo bootctl cleanup ";

    hxd = "hx ~/.files/";
    hxc = "hx ~/code/";

    lr = "eza -R";
    tree = "eza -T";

    startupctl = "systemctl list-unit-files --type=service | grep enabled";

    ga = "git add .";
    gap = "git add -p";
    gc = "git commit -m";
    gu = "git push";
    gp = "git pull";
    gs = "git status";
    gd = "git diff";

    vim = "nvim";
    vi = "nvim";
  };
}
