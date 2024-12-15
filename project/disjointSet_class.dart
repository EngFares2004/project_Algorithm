class DisjointSet {
  late List<int> parent;
  late List<int> rank;

  DisjointSet(int n) {
    parent = List.generate(n, (index) => index);
    rank = List.generate(n, (index) => 0);
  }

  int find(int u) {
    if (parent[u] != u) {
      parent[u] = find(parent[u]);
    }
    return parent[u];
  }

  void union(int u, int v) {
    int rootU = find(u);
    int rootV = find(v);

    if (rootU != rootV) {
      if (rank[rootU] > rank[rootV]) {
        parent[rootV] = rootU;
      } else if (rank[rootU] < rank[rootV]) {
        parent[rootU] = rootV;
      } else {
        parent[rootV] = rootU;
        rank[rootU] += 1;
      }
    }
  }
}