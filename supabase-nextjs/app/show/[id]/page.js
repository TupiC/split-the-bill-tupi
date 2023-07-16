import { createServerComponentClient } from "@supabase/auth-helpers-nextjs";
import { cookies } from "next/headers";
import Link from "next/link";

export default async function Page({ params }) {
  const supabase = createServerComponentClient({ cookies });
  const { data: transactions } = await supabase
    .from("transactions")
    .select(
      `*,
      groups (
        groupname
      ),
  users(username)
`
    )
    .eq("transactionId", params.id);

  const { data: userTransactions } = await supabase
    .from("userTransaction")
    .select(
      `
    *,
    users(username)
    `
    )
    .eq("transactionId", params.id);

  const dateObj = new Date(Date.parse(transactions[0].createdAt));
  const day = dateObj.getDate();
  const month = new Intl.DateTimeFormat("en-US", { month: "short" }).format(
    dateObj
  );
  const minutes = dateObj.getMinutes();
  const hours = dateObj.getHours();
  const year = dateObj.getFullYear();
  const dateFormatted = `${day}. ${month} ${year}, ${hours}:${minutes}`;
  return (
    <>
      <h2>{transactions[0].groups.groupname}</h2>
      <div className="overlay">
        <h3>{transactions[0].title}</h3>
        <p>{dateFormatted}</p>
        <ul>
          {userTransactions?.map((ut) => (
            <li key={ut.userTransactionId} className="flex-list">
              <span>{ut.users.username}</span>
              <span className="negative"> {ut.amount.toFixed(2)}€</span>
            </li>
          ))}
          <li id="sum" className="flex-list">
            <span>{transactions[0].users.username}</span>
            <span class="positive">{transactions[0].total.toFixed(2)}€</span>
          </li>
        </ul>
        <p className="center-ui">
          <Link href="/" className="button">
            back
          </Link>
        </p>
      </div>
    </>
  );
}
