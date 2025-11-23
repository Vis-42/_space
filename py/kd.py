import ollama
client=ollama.Client()
model="deepseek-r1:8b"
prompt="What is rizz?"
response=client.generate(model=model, prompt=prompt)
print("response from ollama")
print(response.response)
