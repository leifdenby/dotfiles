import subprocess
import json
import pandas as pd
import tabulate
import humanize
import isodate


def main(tw_args=[], limit_per_project=1, extra_columns=[]):
    columns = ["project", "description"] + extra_columns
    projects = subprocess.check_output(["task", "_projects"]).decode().splitlines()

    import datetime as dt
    from dateutil.tz import gettz

    berlin = gettz("Europe/Berlin")
    now = dt.datetime.now(tz=berlin)

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

        def _parse_due(task):
            if "due" in task:
                task["due"] = humanize.naturalday(isodate.parse_datetime(task["due"]))
            return task

        tasks = map(_parse_due, tasks)

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
