import 'disjointSet_class.dart';
import 'edge_class.dart';
void main() {
  int n = 4;
  List<Edge> edges = [
    Edge(0, 1, 10),
    Edge(0, 2, 6),
    Edge(0, 3, 5),
    Edge(1, 3, 15),
    Edge(2, 3, 4)
  ];

  List<Edge> mst = kruskal(n, edges);
  print('MST edges:');
  for (var edge in mst) {
    print('(${edge.u}, ${edge.v}) with weight ${edge.weight}');
  }
}

void heapify(List<int> arr, int n, int i) {
  int largest = i;
  int left = 2 * i + 1;
  int right = 2 * i + 2;

  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }

  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  if (largest != i) {
    int temp = arr[i];
    arr[i] = arr[largest];
    arr[largest] = temp;

    heapify(arr, n, largest);
  }
}
void buildMaxHeap(List<int> arr) {
  int n = arr.length;

  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(arr, n, i);
  }
}
void heapSort(List<int> arr) {
  int n = arr.length;

  buildMaxHeap(arr);

  for (int i = n - 1; i > 0; i--) {
    int temp = arr[i];
    arr[i] = arr[0];
    arr[0] = temp;

    heapify(arr, i, 0);
  }
}

List<Edge> kruskal(int n, List<Edge> edges) {
  List<Edge> mst = [];
  DisjointSet dsu = DisjointSet(n);

  edges.sort((a, b) => a.weight.compareTo(b.weight));

  for (var edge in edges) {
    if (dsu.find(edge.u) != dsu.find(edge.v)) {
      dsu.union(edge.u, edge.v);
      mst.add(edge);
    }
  }

  return mst;
}
