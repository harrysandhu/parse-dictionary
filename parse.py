#!/usr/bin/env python3
import re
import json
if __name__ == "__main__":
    data = ""
    with open("./parse/webster.txt", 'r') as f:
    data = f.read()
    ths = ""
    with open('./parse/syns.json') as f:
        ths = json.load(f)
        f.close()
    regexPattern = '\n([A-Z].[A-Z; ]{1,}[A-Z])'
    sarr = re.split(regexPattern, data)
    wordsx = {}
    for i in range(1, len(sarr), 2):
        w = sarr[i]
        if ';' in sarr[i]:
            w = sarr[i].split(";")[0]
        attrs = sarr[i+1]
        strs = attrs.split("\n\n")
        if w in wordsx:
            wordsx[w]["strs"].append(strs)
        else:
            wordsx[w] = {"strs": []}
            wordsx[w]["strs"].append(strs)
        
    # for strs in words
    Warr = {}
    # for t, w in words.items():
    for t, strs in wordsx.items():
        X = {"words": []}
        for prew in strs.values():
        
        
            for w in prew:
                W[t] = {}
            
                W[t]["extras"] = []
                W[t]["bd"] = ""
                W[t]["etym"] = ""
                W[t]["defn"] = ""

                for atr in range(len(w)):
                    if atr == 0:
                        W[t]["bd"] = w[atr].split(',')[0].replace('\n', '')
                        W[t]["etym"] = ''.join(w[atr].split(',')[1:]).split("Etym")[0]
                    elif w[atr].split("fn:")[0] == "De":
                        W[t]["defn"] = w[atr].split(',')[0].replace('\n', '')
                    elif w[atr].split(".")[0].isalnum():
                        W[t]["extras"] += [w[atr]]
                            
                X["words"].append(W[t])
                
            Warr[t] = X
            Warr[t]["syn"] = []
            Warr[t]["ant"] = []
            
    for a, t in ths.items():
        a = a.upper()
        if a in Warr:
            Warr[a]["syn"] = t["syn"]
            Warr[a]["ant"] = t["ant"]


    k = json.dumps(Warr)
    with open('./parse/websterdic1.json', 'w') as f:
    f.write(k)
    f.close()