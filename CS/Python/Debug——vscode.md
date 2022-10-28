如何在vscode中仿造一个debug模式。当有python带参数时是在命令行执行，不带时则是在vscode中运行

```python
import sys
if __name__ == "__main__":
    try:
        a = sys.argv[1]
    except:
        a=0
        print("no input")
    print(a)
```

