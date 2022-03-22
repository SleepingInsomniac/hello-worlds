#include <GLFW/glfw3.h>

int main(void) {
  if (!glfwInit()) return -1;

  GLFWwindow* window = glfwCreateWindow(100, 100, "Hello World", NULL, NULL);

  if (!window) {
    glfwTerminate();
    return -1;
  }

  glfwMakeContextCurrent(window);
  glClearColor(
    0.0f, // r
    1.0f, // g
    0.5f, // b
    0.0f  // a
  );

  while (!glfwWindowShouldClose(window)) {
    glClear(GL_COLOR_BUFFER_BIT);
    glfwSwapBuffers(window);
    glfwPollEvents();
  }

  glfwTerminate();
  return 0;
}
