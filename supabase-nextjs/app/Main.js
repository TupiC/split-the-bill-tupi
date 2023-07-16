import supabase from "@/utils/supabase";
import Link from "next/link";
import React from "react";

export async function Main({}) {
  const { data: groups } = await supabase.from("groups").select();

  const { data: userInGroup } = await supabase
    .from("userInGroup")
    .select(
      `"*",
        users(username, userId)`
    )
    .eq("groupId", groups[0].groupId);

  const { data: transactions } = await supabase.from("transactions").select(`
            *,
            users (
                userId, username
            )
        `);

  const { data: usersData } = await supabase.from("users").select("*");
  const { data: transactionsData } = await supabase
    .from("userTransaction")
    .select("*");

  const userAmountData = usersData.map((user) => {
    const userTransactions = transactionsData.filter(
      (transaction) => transaction.userId === user.userId
    );
    const totalAmount = userTransactions.reduce(
      (total, transaction) => total + transaction.amount,
      0
    );
    return {
      ...user,
      amount: totalAmount,
    };
  });

  console.log(groups);
  console.log("uig", userAmountData);
  return (
    <main>
      <h2>{groups[0].groupname}</h2>
      <div className="overlay">
        <div id="overview">
          <h2>Overview</h2>
          <ul>
            {userAmountData.map((data) => {
              return (
                <li className="flex-list" key={data.userId}>
                  {data.username}
                  {data.amount < 0 && (
                    <span className="negative flex-right">
                      {data.amount.toFixed(2)}€
                    </span>
                  )}
                  {data.amount >= 0 && (
                    <span className="positive flex-right">
                      {data.amount.toFixed(2)}€
                    </span>
                  )}
                </li>
              );
            })}
          </ul>
          <form action="addUser.php" method="post" className="center-ui">
            <input type="hidden" name="groupId" value="9" />
            <input
              type="submit"
              value="Add user"
              name="submit"
              className="button"
            />
          </form>
        </div>
        <div id="expenses">
          <h2>Expenses</h2>

          <ul>
            {transactions?.map((transaction) => (
              <li key={transaction.transactionId}>
                <Link
                  href={`/show/${transaction.transactionId}`}
                  className="flex-list two-row-list"
                >
                  <p className="expense-title">{transaction.title}</p>
                  <p></p>
                  <p>{transaction.users.username}</p>
                  <p className="flex-right">{transaction.total.toFixed(2)}€</p>
                </Link>
              </li>
            ))}
          </ul>
          <Link href="/add">
            <input
              type="submit"
              value="Add new expense"
              name="submit"
              className="button"
            />
          </Link>
        </div>
      </div>
    </main>
  );
}
