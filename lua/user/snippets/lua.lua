local ls = require("luasnip")

local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local cppBoilerplate = s('bits', fmt([[
#include<bits/stdc++.h>
using namespace std;

void solve(){{
 {}
}}

int main(){{
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    int t;
    cin>>t;

    while(t--){{
      solve();
    }}

    return 0;
}}
]], {
  i(1, "")
}))

table.insert(snippets, cppBoilerplate)

return snippets, autosnippets

