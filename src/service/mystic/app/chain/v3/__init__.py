from ..base import BaseChain
from langchain_openai.chat_models import ChatOpenAI
from dotenv import load_dotenv

load_dotenv()
class ChainV3(BaseChain): #gpt-3.5-turbo
	def __init__(self, connection_id, template):
		super().__init__(connection_id, template, ChatOpenAI(model_name='gpt-3.5-turbo'))