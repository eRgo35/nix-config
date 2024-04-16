{
  myAliases = {
    ".." = "cd ..";
    "cd.." = "cd ..";
    
    ls = "command eza";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";

    l="eza -G --icons";
    ll="eza -l --icons";
    lg="eza -lG";
    lall="eza -lahF --icons --git";
    lalg="eza -laGhF --icons --git";
    latree="eza -laGghHT --git --icons";
    la = "eza -la --git --icons";
    lsd = "eza -laD";

    cls="clear";
    # df="df -ahiT --total";
    userlist="cut -d: -f1 /etc/passwd";
    free="free -mt";
    du="du -ach | sort -h";
    ps="ps auxf"; 

    sudo="sudo ";
    reload="exec $SHELL -l";

    xclip = "xclip -selection c";

    mkdir="mkdir -pv";
    psmem="ps -e -orss=,args= | sort -b -k1 -nr";
    psmem10="ps -e -orss=,args= | sort -b -k1 -nr | head -10";
    pscpu="ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr";
    pscpu10="ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1,1n -nr | head -10";

    gua = "git remote | xargs -L1 git push --all";
  };
}
