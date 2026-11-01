import unittest


def greet(name: str = "MacBook") -> str:
	return f"Hello, {name}!"


class TestGreeting(unittest.TestCase):
	def test_default_greeting(self) -> None:
		self.assertEqual(greet(), "Hello, MacBook!")

	def test_custom_name(self) -> None:
		self.assertEqual(greet("Python"), "Hello, Python!")


if __name__ == "__main__":
	unittest.main()
