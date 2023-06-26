import subprocess
import json
import pandas as pd
import tabulate


def main(tw_args=[], limit_per_project=1, extra_columns=[]):
    columns = ["project", "description"] + extra_columns
    projects = subprocess.check_output(["task", "_projects"]).decode().splitlines()

    tasks_all = []
    for project in projects:
        args = [
            "task",
            f"project:{project}",
            "-BLOCKED",
            f"limit:{limit_per_project}",
            "export",
        ] + tw_args
        tasks = json.loads(subprocess.check_output(args))
        tasks_all += tasks

    df = pd.DataFrame(tasks_all).set_index("id")
    df = df.sort_values(by=["urgency"], ascending=False)
    print(tabulate.tabulate(df[columns], headers=columns))


if __name__ == "__main__":
    import argparse

    argparser = argparse.ArgumentParser()
    argparser.add_argument("tw_args", nargs="*", default=[])
    argparser.add_argument("--extra-columns", default=[], nargs="*")
    args = argparser.parse_args()
    main(tw_args=args.tw_args, extra_columns=args.extra_columns)
