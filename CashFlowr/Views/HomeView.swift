//
//  HomeView.swift
//  CashFlowr
//
//  Created by Dat Nguyen on 1/6/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Overview Cards
                    HStack(spacing: 16) {
                        SummaryCard(title: "Total Income", amount: "$12,500")
                        SummaryCard(title: "Total Expenses", amount: "$8,200")
                    }

                    SummaryCard(title: "Net Cash Flow", amount: "$4,300", fullWidth: true)

                    // Spending Habits
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Spending Habits")
                            .font(.headline)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Monthly Spending")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text("$8,200")
                                .font(.title2)
                                .bold()

                            Text("This Month")
                                .font(.caption)
                                .foregroundColor(.blue)

                            HStack(alignment: .bottom, spacing: 12) {
                                ForEach(0..<6) { _ in
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 20, height: 100)
                                }
                            }

                            HStack(spacing: 24) {
                                ForEach(["Jan", "Feb", "Mar", "Apr", "May", "Jun"], id: \.self) {
                                    Text($0)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }

                    // Income Trends
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Income Trends")
                            .font(.headline)

                        Text("Income Over Time")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("$12,500")
                            .font(.title2)
                            .bold()

                        Text("Last 6 Months")
                            .font(.caption)
                            .foregroundColor(.blue)

                        // Placeholder for graph
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 2)
                            .frame(height: 120)

                        HStack(spacing: 24) {
                            ForEach(["Jan", "Feb", "Mar", "Apr", "May", "Jun"], id: \.self) {
                                Text($0)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Overview")
        }
    }
}

struct SummaryCard: View {
    let title: String
    let amount: String
    var fullWidth: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(amount)
                .font(.title2)
                .bold()
        }
        .padding()
        .frame(maxWidth: fullWidth ? .infinity : 200, alignment: .center)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    HomeView()
}
