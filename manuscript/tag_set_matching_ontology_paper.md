# タグ群マッチ・オントロジシステム
## 多層意味グラフによる異分野リポジトリの自己組織化

**Tag-Set Matching Ontology System — A Multi-Layer Semantic Graph for Self-Organization of Heterogeneous Repositories**

### 要旨

本稿では、異種リポジトリ、ドメイン、能力、エージェントおよびワークフローを、タグ群を意味署名（semantic signature）として扱うことで接続・自己組織化する「タグ群マッチ・オントロジシステム」を提案する。従来の分類では、リポジトリを単一のドメインに配置することが多い。しかし実際の知識・技術資産は複数の意味的関係を持つ。本研究では、タグの集合間の一致、類似、包含、変換をグラフとして表現し、異なる事業領域に存在する資産を共通表現によって発見する。

代表例として、ファミリーコンピュータ、編み物、刺繍を `pixel`、`stitch`、`grid`、`pattern` 等の概念で接続する「dots」クラスタを示す。さらに、リポジトリ観測からオントロジ宣言、クラスタリング、能力抽出、エージェント生成、ワークフロー実行、現実世界の証拠による再評価までの循環を定義する。これにより、オントロジを静的な分類表ではなく、実行可能な組織知の意味層として位置づける。

**キーワード:** オントロジ、タグ群、意味署名、意味グラフ、自己組織化、リポジトリ、エージェント、ワークフロー、クロスドメイン

## 1. はじめに

ソフトウェア資産が多数の独立したリポジトリに分散すると、単純なフォルダ構造やドメイン分類だけでは、異なる領域に存在する再利用可能な知識・能力を発見しにくくなる。例えば、ゲームの画素表現と、編み物や刺繍の目数・マス目による表現は、事業上は異なるが、離散的な二次元表現という点で共通している。

そこで本研究では、リポジトリを「所属ドメイン」だけで分類するのではなく、複数のタグから構成される意味署名として表現する。タグ群同士を比較することで、明示的に同じカテゴリへ配置されていなくても、深い意味的関係を持つ対象を発見できる。

## 2. 基本仮説

本研究の中心仮説は次の通りである。

> **タグ群は、対象の意味的特徴を表す署名であり、タグ群同士のマッチングによって異分野間の意味的接続を発見できる。**

リポジトリ \(A\) のタグ集合を

\[
T_A=\{a_1,a_2,\ldots,a_n\}
\]

リポジトリ \(B\) のタグ集合を

\[
T_B=\{b_1,b_2,\ldots,b_m\}
\]

とする。

基本的な一致度として Jaccard 型指標を用いる。

\[
M(A,B)=\frac{|T_A\cap T_B|}{|T_A\cup T_B|}
\]

ただし、実用システムでは単純一致だけでなく、同義語、上位概念、関連概念、変換関係などに重みを与える必要がある。

## 3. 多層モデル

対象を単一の分類木ではなく、以下の多層グラフとして扱う。

```text
repo
  ↕
cluster
  ↕
concept / tag-set
  ↕
capability
  ↕
agent
  ↕
workflow
  ↕
provider / real world
```

各層の責任を次のように定義する。

- **repo:** 責任を持つ実装単位
- **tag set:** 意味署名
- **domain:** 意味的クラスタ
- **capability:** 再利用可能な接続能力
- **ontology:** 宣言された意味グラフ
- **agent:** 実行可能な意味的役割
- **workflow:** 意味から行動への経路
- **evidence:** 現実世界からのフィードバック

重要なのは、domain と meaning を同一視しないことである。ドメインは意味空間上の一つのクラスタにすぎず、意味的接続はドメイン境界を越えて存在し得る。

## 4. Tag-Set Matching

### 4.1 一致

最も単純な一致は共通タグ数に基づく。

\[
M(A,B)=\frac{|T_A\cap T_B|}{|T_A\cup T_B|}
\]

### 4.2 重み付き一致

タグ \(x\) の重要度を \(w(x)\)、タグ間の意味関係を \(r(x,y)\) とすると、重み付き一致は

\[
M_w(A,B)=
\frac{\sum_{(a,b)\in Match} w(a,b)}
{\sum_{a\in T_A}w(a)+\sum_{b\in T_B}w(b)}
\]

として表現できる。

ここで `exact`, `related`, `parent`, `transformation` 等を異なる関係として扱うことで、単純な文字列一致を超えた意味マッチングが可能になる。

## 5. 多層タグ

タグは単なる検索用メタデータではない。タグには少なくとも以下の層を持たせる。

1. **対象タグ:** pixel, stitch, textile
2. **表現タグ:** grid, sprite, motif, pattern
3. **能力タグ:** conversion, generation, embroidery
4. **業務タグ:** OEM, sales, fulfillment
5. **実行タグ:** agent, workflow, provider
6. **証拠タグ:** observed, measured, validated

この構造により、「何であるか」「どう表現されるか」「何ができるか」「どう実行するか」を分離できる。

## 6. クロスドメインクラスタ：Dots

本システムの重要な例として `dots` クラスタを定義する。

### 6.1 ファミリーコンピュータ

- pixel
- tile
- sprite
- grid

### 6.2 編み物

- stitch
- grid
- pattern

### 6.3 刺繍

- stitch
- grid
- motif

### 6.4 テキスタイル

- pattern
- grid
- repeat

これらは同一の事業ドメインではない。しかし「離散表現」「格子」「パターン」という共通構造を持つ。

したがって、

\[
pixel\_grid \rightarrow stitch\_grid
\]

\[
sprite \rightarrow textile\_pattern
\]

のような意味変換を定義できる。

この変換こそが、単純なカテゴリ分類では発見しにくいクロスドメイン能力となる。

## 7. Semantic Transformation

タグ群マッチングの目的は「似ているものを探す」ことだけではない。重要なのは、一方の表現を他方の表現へ変換する能力を発見することである。

例えば、

```text
pixel art
    ↓
pixel grid
    ↓
stitch grid
    ↓
knitting / embroidery pattern
    ↓
manufacturing data
```

という変換経路を考えることができる。

このとき `dots` は単なる分類名ではなく、複数ドメインを横断する意味変換の中間概念となる。

## 8. Declaration と Inference

オントロジシステムでは、観測事実と意味的判断を分離する必要がある。

```text
observed
   ↓
inferred
   ↓
proposed
   ↓
validated
   ↓
declared
```

`bonsai/repos` のような観測システムは、リポジトリの実際の状態を記録する。一方、オントロジは、その観測結果から意味を宣言する。

AI はクラスタ、タグ、関係、変換を**推論・提案**できる。しかし、正式な意味として扱うには検証・宣言の段階を設ける。

## 9. Repository Graph

オントロジ全体をグラフ

\[
G=(V,E)
\]

として表現する。

ノード \(V\) は repository, cluster, concept, capability, agent, workflow, provider 等から構成される。

エッジ \(E\) は以下のような意味関係を持つ。

- `belongs_to`
- `uses`
- `implements`
- `supports`
- `transforms`
- `depends_on`
- `executes`
- `produces`
- `validated_by`

これにより、リポジトリを固定された木構造ではなく、意味関係のネットワークとして扱える。

## 10. repo2agent

本モデルは、リポジトリからエージェントを生成する `repo2agent` 概念へ接続できる。

```text
repository facts
       ↓
semantic observation
       ↓
tag set
       ↓
ontology
       ↓
cluster
       ↓
capability
       ↓
agent
       ↓
workflow
       ↓
provider / real world
       ↓
evidence
       ↓
semantic review
```

この流れでは、エージェントはリポジトリ単位で機械的に生成されるのではなく、意味的な能力単位から構成される。

## 11. 自己組織化

自己組織化の最小ループを以下に定義する。

```text
repo
 ↓
tags
 ↓
ontology
 ↓
cluster
 ↓
capability
 ↓
agent
 ↓
workflow
 ↓
real world
 ↓
evidence
 ↓
new tags / semantic review
```

実行結果によって新しいタグ、関係、能力が発見されるため、オントロジは固定的な辞書ではなく、観測と実行によって更新される意味モデルとなる。

## 12. 実装アーキテクチャ

BONSAI においては、次の責務分離が適切である。

| 層 | 主な責務 |
|---|---|
| `bonsai/repos` | リポジトリの観測事実 |
| `bonsai/ontology` | 意味・概念・関係の定義 |
| `bonsai/ecosystem.md` | 意味クラスタのレジストリ |
| `bonsai/yaml-as-agent` | 宣言からエージェントへの変換 |
| `bonsai/think` | 推論・思考メソッド |
| `bonsai/soshiki` | エージェント組織 |
| `bonsai/aw` | 実行ワークフロー |
| provider repositories | 外部サービス・製造・販売との接続 |

この分離により、「観測」「意味」「判断」「実行」「現実」を混在させずに済む。

## 13. 最小データモデル

クラスタを次のように表現できる。

```yaml
id: dots
type: cross_domain_cluster

name: Dots

concepts:
  - pixel
  - stitch
  - grid
  - pattern
  - discrete_representation

domains:
  - game
  - knitting
  - embroidery
  - textile
  - pixel_art

transformations:
  - from: pixel_grid
    to: stitch_grid
  - from: sprite
    to: textile_pattern

status:
  observed: true
  inferred: true
  validated: false
  declared: true
```

ここで `dots` はドメインではなく、ドメインを横断する表現クラスタである。

## 14. 考察

本方式の特徴は、分類の中心を「所属」から「関係」へ移す点にある。

従来型の分類では、

```text
Game
 └── Famicom

Craft
 ├── Knitting
 └── Embroidery
```

となる。

タグ群マッチングでは、

```text
          Dots
        /  |  \
   Famicom Knit Embroidery
      |      |      |
    pixel  stitch  stitch
      \      |      /
          grid
```

のように、異なるドメインに属する対象を共通概念で接続できる。

これにより、既存のカテゴリでは見えなかった再利用可能な能力を発見できる。

## 15. 期待される効果

第一に、異分野資産の発見性が向上する。第二に、能力単位での再利用が可能になる。第三に、リポジトリからエージェント、ワークフローまでの自動生成経路を明確化できる。第四に、現実世界の結果を意味モデルへフィードバックできる。

特に重要なのは、AI が「分類器」にとどまらず、「意味関係の発見器」として機能する点である。

## 16. 結論

本稿では、タグ群を意味署名として扱うタグ群マッチ・オントロジシステムを提案した。

中心命題は、

> **タグは検索用メタデータではなく、タグ群は対象の意味署名である。**

というものである。

この署名を比較し、クラスタ化し、変換関係を抽出することで、ゲーム、編み物、刺繍、テキスタイルなどの異分野を共通の意味構造で接続できる。

さらに、

\[
repo \rightarrow tags \rightarrow ontology \rightarrow cluster
\rightarrow capability \rightarrow agent \rightarrow workflow
\rightarrow real\ world \rightarrow evidence
\]

という循環を構築することで、オントロジを単なる分類体系から、自己組織化する実行可能な意味基盤へ拡張できる。

BONSAI において `bonsai/repos` が「観測」、`bonsai/ontology` が「意味の宣言」、`bonsai/ecosystem.md` が「意味クラスタのレジストリ」、`repo2agent` が「意味から実行への変換」を担う構成は、このモデルを実装する一つの具体例となる。

今後の課題は、タグ間の意味距離、変換コスト、証拠の信頼度、クラスタの安定性を定量化し、実データを用いた評価を行うことである。

## 付録A：中心概念

```text
repo        = responsibility
domain      = semantic cluster
tag set     = semantic signature
ontology    = declared meaning graph
capability  = reusable connection
agent       = executable semantic role
workflow    = path from meaning to action
evidence    = feedback from reality
```

## 付録B：BONSAIへの適用

本研究の実装対象として、`bonsai/ontology` を意味モデルの基盤、`bonsai/ecosystem.md` をクラスタレジストリ、`bonsai/repos` を観測データ源とする。

最終的には、リポジトリの増加に伴って意味グラフが拡張され、新しいクロスドメインクラスタと能力が発見され、それらがエージェントとワークフローへ変換される自己組織化アーキテクチャを目指す。
