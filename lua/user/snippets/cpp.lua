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

#define sfor(i, l, r) for (int i = l; i < r; ++i)
#define bfor(i, r, l) for (int i = r; i >= l; --i)
#define endl "\n";
#define all(a) a.begin(), a.end()
using ll = long long;
using vi = vector<int>;
using ld = long double;
using pii = pair<int, int>;

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

local spf = s('spf', fmt([[
class SPF {{
public:
  vector<bool> isPrime;
  vector<int> hpf;
  vector<int> lpf;
  int N;
  SPF(int N){{
    this->N = N;
    isPrime.resize(N + 1, true);
    hpf.resize(N + 1);
    lpf.resize(N + 1, 0);

    isPrime[0] = false;
    isPrime[1] = false;

    for (int i = 2; i <= N; i++) {{
      if (isPrime[i]) {{
        lpf[i] = hpf[i] = i;
        for (int j = 2 * i; j <= N; j += i) {{
          isPrime[j] = false;
          hpf[j] = i;
          if (lpf[j] == 0)
            lpf[j] = i;
        }}
      }}
    }}
  }};
}};

]], {}))

local binexp = s('binexp', fmt([[ 
ll binexp(int a, int b) {{
  ll res = 1;
  ll pow = a;
  while (b) {{
    if (b & 1) {{
      res *= pow;
    }}
    pow *= pow;
    b >>= 1;
  }}

  return res;
}}

]], {}))

local dsu = s('dsu', fmt([[ 
int findSet(int i, vector<int> &parent) {{
  if (parent[i] == -1)
    return i;
  return parent[i] = findSet(parent[i], parent);
}}

void unionSet(int i, int k, vector<int>& parent, vector<int>& rank){{
  int s1 = findSet(i, parent);
  int s2 = findSet(k, parent);

  if(s1 != s2){{
    if(rank[i] < rank[k]){{
      parent[i] = k;
      rank[k] += rank[i];
    }}
    else{{
      parent[k] = i;
      rank[i] += rank[k];
    }}
  }}
}}

]], {}))

table.insert(snippets, cppBoilerplate)
table.insert(snippets, spf);
table.insert(snippets, binexp)
table.insert(snippets, dsu)

return snippets, autosnippets
