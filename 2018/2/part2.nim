# This is a comment
import sets
import strformat
import strutils

proc diff(input1: string, input2: string): string =
    if len(input1) != len(input2):
        return
    for idx in low(input1)..high(input1):
        if input1[idx] == input2[idx]:
            # echo fmt("{letter} appears twice.")
            add(result, input1[idx])


proc checksum(input: string): string =
    let arr = input.split('\n')

    for i1 in low(arr)..high(arr):
        for i2 in low(arr)..high(arr):
            let cmp = diff(arr[i1], arr[i2])
            if len(arr[i1]) - len(cmp) == 1:
                return cmp

assert checksum("""abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz""") == "fgij"

echo checksum("""pbopcmjeizuhxlqnwasfgtycdm
pjokrmjeizuhxlqnfasfguycdv
pbokrpjejkuhxlqnwasfgtycdv
sbokrmjeizuhxaqnwastgtycdv
pbokrmjeizuhxljnnasfgtycnv
pbokrqjeizuhxbqndasfgtycdv
bbokrmjeizuhxlqnwasfgtycfj
pbokrmjeisuhxlqnwasfzdycdv
pbokrmjefxuhxlqnwasfptycdv
pqokrmjenzuhxlqnwasfgtygdv
pbokrmjeizunklqnwassgtycdv
pbokrmjeizghxvqnkasfgtycdv
lboirmjeizuhxlqnwfsfgtycdv
pbofrmjeizuhalqnwasfgtyddv
pbokrmjeiguhplqcwasfgtycdv
pbokrmjeizzhxlqnwavfgtyctv
pbokrmjeizuhxlqnwaefgtycaj
pbokzmjedzuhxlqnwasfgtlcdv
pnokrmjegzuhxlbnwasfgtycdv
pbojrmjeizuhtlqniasfgtycdv
pbokxmiefzuhxlqnwasfgtycdv
pbokrmoeizuhxlqnpasngtycdv
abokrmjeezuhxlqnwasfdtycdv
pbokrmyeizugxlqnwasfgtycda
pbokdmjeizuhxlqnuatfgtycdv
psokrmjeiauhxlqnwasxgtycdv
pbokrmjeizuhxlqzwasfgtyzdy
pboktmjeizuhxnqndasfgtycdv
pbodrrjeizuhxlqnwasfgtycdb
pbokrmjekzuhxljnwasfgtycuv
pbokrmjnizuhllqnwawfgtycdv
prmkrmjeiwuhxlqnwasfgtycdv
pbokrmjeizkhxlenwajfgtycdv
pbofrmjeizuixlqnwasfgoycdv
gbhkrmjeizuhclqnwasfgtycdv
pbokrmweizuwxlqnwasfgtycyv
pbukrmjeizuhxlqnwasfgqhcdv
pbokxmjeizuhxlqnwasfgtecdu
pbokomjeizuhrlqnfasfgtycdv
bbokymjeizuhxlqnpasfgtycdv
pbodrmjeizuhxlqnwadfgtgcdv
zbokrljeipuhxlqnwasfgtycdv
pboermjeizuxxlqnwasfgtpcdv
pqbkrmjeizuhxlqnjasfgtycdv
pbokrmfeizuhxvqgwasfgtycdv
pbokrmjeizuhzlqnjasfdtycdv
rbofrmjeizkhxlqnwasfgtycdv
pbokrmseizubxlqnwasfgtycdy
pbocrmjeizuhxaqnwasfgtycda
pbokrmjeizuhxlqndakfgtscdv
pbokrrjeizuhxlqnwgshgtycdv
pbokrajeizuhxpqnwasrgtycdv
pbokrbjeizubxlqnwssfgtycdv
pbokemjhizuhxlqnwazfgtycdv
pbokrmjeizuhxlqntisfgtyrdv
pbokrmjwinuhxlqnwasfgkycdv
pypkrmjeizuhxlqtwasfgtycdv
pbokrmjeizuhxlqniasfrpycdv
pbokomjeizuhxlqnwasfgtgcdw
pbokrmjeizusplqnwxsfgtycdv
pbodrmueizxhxlqnwasfgtycdv
pbokwmjeizurxlqnwasfgtycdi
pbohrmjejzuhxlqnwasfgtycgv
pbokrmtqizuhxlqnwasfitycdv
ptozrmjeizuhylqnwasfgtycdv
pbokrmjtizuhxlqfwasfgtykdv
pbokrmpeizuhxnqmwasfgtycdv
pbokrmjeizujxlynwtsfgtycdv
dbokrmjeizuhxlqnwasngticdv
pbskrmjeizuhxlqnrasfttycdv
pbwkrmjerzuhxlqnwaslgtycdv
pboyrmceizuhxlqnwssfgtycdv
pbokpmjeizchxlqngasfgtycdv
pbokrmjenzuhxlqnwcsfgxycdv
pbxkrmjeizuhxlqnwadfgtyckv
pbqkrmjeizuhxlqnwasdgdycdv
pbokrmoeizdhxlqnwasfgtycqv
pbokrmjejzuhxlqnwksfgtycwv
pbfkrmjeieuhxlnnwasfgtycdv
pbokrmjeiuuhxlqnpalfgtycdv
pbokrmjeizunxyqnwasfgtdcdv
pbokrmjeazuhxrqnwasogtycdv
pbmkrmjeizuhxlqnwaufgtycdj
xbskrmjeipuhxlqnwasfgtycdv
tbokrujlizuhxlqnwasfgtycdv
xbokvmjeizuhxyqnwasfgtycdv
pbnhrmheizuhxlqnwasfgtycdv
pboorajrizuhxlqnwasfgtycdv
pbokrmjeizuhxminwusfgtycdv
pboqrmjeizuhxlqnwaslgtscdv
pgokrdjeizuhxlnnwasfgtycdv
pbokrmjeizuhxiqnwasvttycdv
pbokrmwnizuhzlqnwasfgtycdv
pbokrmjlizmhjlqnwasfgtycdv
pbwkrmjeizohxlqnwasfgtyzdv
pbykrmjmizwhxlqnmasfgtycdv
pbokrmjzizuhxeqnwasfgtpcdv
pbokrmjewzuhxzqnwasfgtybdv
pbokrmjeimupxlonwasfgtycdv
pbokrmjvizuhxlqnuasfgtycqv
pbokrmjeizjdxlqnwasfetycdv
pbofrmjeizurxlqnwasfztycdv
pbozrmjeizuhxxqpwasfgtycdv
pbovtmjeizuhxlqnwapfgtycdv
prokrmjeuzuhxlqnwasfgtycqv
ubokrmjeizuhxljnwasfgtdcdv
pboknmjepzuhxlqnwasogtycdv
pbokrmjaizuaxljnwasfgtycdv
pbdkrcjeizuhxlqnwasfgtvcdv
pbokymjeizuhxlqnwaxfgtyfdv
pbokrmjaizuhxlqnfasfgtyodv
pdekrmmeizuhxlqnwasfgtycdv
rbokrmjeizuuxlqnwasfgtycdj
pbokrmneifuhxlqiwasfgtycdv
pbokrmjeizlbxlunwasfgtycdv
pbokrmjewzuhxxqnwasfgoycdv
pbokrmjeizuhxlqtwasfgtzcdo
pbokrmkeizzhxlqnwasfgtycmv
pbokrmjeiquhxlqnywsfgtycdv
xbokrmjeizjhxlqdwasfgtycdv
pbokrmjeizahxzqnzasfgtycdv
pbokrmjeizuhxmqmwasfgtytdv
pbokrmheiluhxlqnwasfgoycdv
rbokrmjeizuhxlqnwaslgtycqv
pbbkzmjeizuhxvqnwasfgtycdv
pbokrmjeizudxlznwgsfgtycdv
pbokemjeizuhxlqnwascgtysdv
pbokrmjdizuexlgnwasfgtycdv
pbokzmjeizuhxlqnwnsfggycdv
pbokrmjeizuhxtqnwasfgiycdy
bbokrmjeizuhclunwasfgtycdv
pbtkrmjeieuhxlqnwasfgtycrv
pbokrmjeizutxlbnwasngtycdv
pbokrmjevzumxlqnwasfgtyydv
pbokrmjsizuhxlqowasfgtycyv
pbssrmjeizuhxlqbwasfgtycdv
pbokrmjeizuhflqnwxsfstycdv
pbokimjeizuhxlqnwasfgtywdm
pbokrmjbizuhxlqdwasfgtygdv
pbokrmheizuhxlqxwasfgtycnv
poakrmjeizuhylqnwasfgtycdv
vbrkrmjeizuhxlqnwaszgtycdv
pbokrmjeizuhxiqnudsfgtycdv
pbokrldeizuhxlqnwasjgtycdv
pbokrmjeizjhflqnwasfgtymdv
pbokrmjeizuhxliawasfgtvcdv
pbokrmjeisuhtoqnwasfgtycdv
nbokrijeizuhxlqnwasfgtycdh
pbokrmjeizrhxlqnwxsfztycdv
pbotrmjeizuhxlcnwasfgtyvdv
pbokrmjewzuhxlquwasfgtjcdv
pbosrmjeipuhxlqnwasfgtvcdv
pbokrmjebzurxlunwasfgtycdv
pbogimieizuhxlqnwasfgtycdv
pbokrmjeizihxlqnwasagtyzdv
pbokrmjeizuoxlqnausfgtycdv
pbokrmjeizuhxlqnwashgbjcdv
pbokrdjeizuhxlnnwasfgoycdv
pbokrzjtizlhxlqnwasfgtycdv
peokrmjexzuhxlqnwasfgoycdv
cboprmjeizuhxlqnwasfgfycdv
pbitrmjeizjhxlqnwasfgtycdv
pbourmjeizuhxldnwjsfgtycdv
pboivmjeizuhxlqnwasvgtycdv
pbokrmjeiduhxaqnqasfgtycdv
pbokicjeiwuhxlqnwasfgtycdv
pbokrmmeizulxlqnwasfgtyvdv
pbokrmjeieuhxlqnaapfgtycdv
pbokxmjeiuuhxlqnwasfgtyqdv
pbokrmjeizuhxgqniaslgtycdv
pbokrmjeizuuxlqnwisfgtyckv
pbovlmjepzuhxlqnwasfgtycdv
pbokrmjeizuhxlqdwaqfgtycdj
pbztrvjeizuhxlqnwasfgtycdv
pbokrmjeizuholunwasfptycdv
pbokrmjeizudxlqnwusfgtycqv
nbokrmjzizmhxlqnwasfgtycdv
pbokrmjeypunxlqnwasfgtycdv
pbokrjjxizuhxlqnwasfgtyddv
pbokrmjeizuhilqnwiufgtycdv
pbokrmjeizuhxtqowasfgfycdv
qbokrgjeizuhxlqnwasfgtycdx
pvoarmjeizuhxlqnwasfgtfcdv
pbokrmjjizuhxlqnwasfggyczv
pbtkrmjeizuhnlqncasfgtycdv
pbokrmjeizuzxlqnwasfgtyjnv
jmokrmzeizuhxlqnwasfgtycdv
pbykrmjmizwhxlqnwasfgtycdv
nbokrmjeizlhxlqnwasfgtecdv
pbokrmjeizuhxlqhwasrgrycdv
pbokrmjeiruhxlqnwasfgtnedv
pbokrmjeizohxlznwasfgtycuv
paokrmjdizuhxlqnwasfktycdv
pbokrmjetzutxlqnwasfntycdv
pboyrmjeizuhxlqnwasfgtetdv
pbokgujeizuhxlqwwasfgtycdv
pbokrifeizshxlqnwasfgtycdv
sbokrmjeizfhxlqnaasfgtycdv
pbokrmjeizuhxlqpwrsfgfycdv
pbokxmjeikuhxlqnwasfctycdv
fbokrmjhizuhxlqnmasfgtycdv
pbekamjeizuhxlqnwaxfgtycdv
pboksmpeizuhxlqnwasfgtyclv
pbokrmjeizrhxdqnwasfgzycdv
pbogrmxeizurxlqnwasfgtycdv
pbokrmjeieuhxlqnwqsfgtychv
vbokrmjeizuhxlqnwabfgtycdq
lbokrmjeizupxlqvwasfgtycdv
pbokrmjeizuhglqnuasfgtucdv
hbokrmjeizuhelqnwasfgtrcdv
pbokrmweizuhxlqnwhsfgtyvdv
pbokrmjeizuhxrqnwasfvtccdv
pbokrmneizuhxlwnyasfgtycdv
ybokymjeqzuhxlqnwasfgtycdv
pbousmjeizuhxlqswasfgtycdv
pblkimjeizuhxlqnwacfgtycdv
psokrmjeizuhxlqnwasfgbpcdv
peokrwjeizghxlqnwasfgtycdv
pbokrmjeizudxlqnwzsfrtycdv
pbotrmjezzxhxlqnwasfgtycdv
pkokrmjezzuhxlqnwasfgtycdh
pbokrmleizuhxlnnwasfgtyndv
pboxwmjeituhxlqnwasfgtycdv
pbokrmjeizoczlqnwasfgtycdv
pbokomjeizuhxlqnwhsfgtybdv
pbhwrmjeizuhxlqnwasfgpycdv
pbwkrmjeizuhxeqnwasfgtyidv
pbokrmjeizuhxlqnjasfgmicdv
tbokrgjeizuhxlqhwasfgtycdv
pbolrqjeizuhxlqnhasfgtycdv
pbogrhjeizbhxlqnwasfgtycdv
pbokrmjeizghxlqnwashgtycdx
pbokrmjeizuhrlqnwasfgthcrv
pbokrmjeizuhxlqnwfsngtacdv
pbokrmxeizuhxlqnwasfotyctv
pbokrmjeizuhxlqnwcsfgnocdv
pnokbmjeizuhxlqnwasfgtscdv
pbowrmjeuzuhxlqnwasfgtycdw
pbokrmjeiyuhxlqnwasqgtvcdv
pbokrmjeivuhxkpnwasfgtycdv
pbokomjeizuhxlqnwasfgtylav
pbdkrmjeizuhxlgnwjsfgtycdv
pbokrmjeizuaxxqnwasfytycdv
pbokrmjerzuhxlqnwasfgtscdk
pbokrmzerzuhxlqnwasfntycdv
pbokrmjeizumxdqnwasfgtyckv
pbtkrmjeizrhxlqnwasfgtjcdv
pbmkrmjuizuhxlqnwasfgtytdv
pbokpmjeizuhxlqnwastgtzcdv
kbokrmjeizuhxlqnwasfgzjcdv
""")
