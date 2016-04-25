from errbot import BotPlugin, botcmd

class Hello(BotPlugin):
	"""An example plugin for ErrBot"""

	@botcmd
	def hello(self, msg, args):
		return "Hello, World! I am a plugin for ErrBot"

