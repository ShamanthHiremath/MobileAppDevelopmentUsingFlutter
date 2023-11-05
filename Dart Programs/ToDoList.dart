class TodoItem {
  String title;
  String description;
  bool isCompleted;

  TodoItem(this.title, this.description, {this.isCompleted = false});
}

class TodoList {
  List<TodoItem> items = [];

  // Method to add a new to-do item
  void addTodoItem(String title, String description) {
    final todoItem = TodoItem(title, description);
    items.add(todoItem);
  }

  // Method to mark a to-do item as completed
  void markTodoItemAsCompleted(int index) {
    if (index >= 0 && index < items.length) {
      items[index].isCompleted = true;
    }
  }

  // Method to display all to-do items, showing their status
  void displayTodoList() {
    for (int i = 0; i < items.length; i++) {
      final todoItem = items[i];
      final status = todoItem.isCompleted ? 'Completed' : 'Not Completed';
      print('Item $i: ${todoItem.title} - ${todoItem.description} ($status)');
    }
  }
}

void main() {
  // Create an instance of the TodoList class
  final todoList = TodoList();

  // Add some to-do items
  todoList.addTodoItem("Task 1", "This is the first task");
  todoList.addTodoItem("Task 2", "This is the second task");
  todoList.addTodoItem("Task 3", "This is the third task");

  // Mark some as completed
  todoList.markTodoItemAsCompleted(0);
  todoList.markTodoItemAsCompleted(2);

  // Display the list of to-do items with their statuses
  todoList.displayTodoList();
}
